import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileImageScreen extends StatefulWidget {
  const ProfileImageScreen({super.key});

  @override
  State<ProfileImageScreen> createState() => _ProfileImageScreenState();
}

class _ProfileImageScreenState extends State<ProfileImageScreen> {
  final SupabaseClient _supabase = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();
  
  String? _imageUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSavedImageUrl();
  }

  // 1. Load the saved image URL when the app opens
  Future<void> _loadSavedImageUrl() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageUrl = prefs.getString('saved_image_url');
    });
  }

  // 2. Pick, upload, and save the image link
  Future<void> _pickAndUploadImage() async {
    // A. Pick the image from gallery
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70, // Compresses image to save storage space
    );

    if (pickedFile == null) return;

    setState(() => _isLoading = true);

    try {
      final file = File(pickedFile.path);
      // Create a unique file name using timestamps
      final String fileName = 'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // B. Upload file to your public Supabase bucket (e.g., 'avatars')
      await _supabase.storage.from('avatars').uploadBinary(
        fileName,
        await file.readAsBytes(),
      );

      // C. Get the permanent public URL
      final String publicUrl = _supabase.storage.from('avatars').getPublicUrl(fileName);

      // D. Save the URL locally so it persists when app closes
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('saved_image_url', publicUrl);

      setState(() {
        _imageUrl = publicUrl;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persistent Storage Display')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 3. Display Logic
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
              ),
              clipBehavior: Clip.antiAlias,
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _imageUrl != null
                      ? Image.network(
                          _imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 50),
                        )
                      : const Icon(Icons.person, size: 80, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _pickAndUploadImage,
              icon: const Icon(Icons.photo_library),
              label: const Text('Pick & Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}