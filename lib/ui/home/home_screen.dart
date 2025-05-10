import 'package:clocki_tracker/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<UserProfileProvider>(context, listen: false)
            .getUserProfile('username', 'password');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
      builder: (context, userProfileProvider, child) {
        if (userProfileProvider.userModel == null) return SizedBox.shrink();
        return Scaffold(
          backgroundColor: const Color(0xFF311B92),
          appBar: AppBar(
            title: const Text('Profile'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      userProfileProvider.userModel?.image != null &&
                              userProfileProvider.userModel!.image!.isNotEmpty
                          ? NetworkImage(userProfileProvider.userModel!.image!)
                          : const AssetImage('assets/default_avatar.png')
                              as ImageProvider,
                ),
                const SizedBox(height: 16),

                // Full Name
                Text(
                  "${userProfileProvider.userModel!.firstName ?? ''} ${userProfileProvider.userModel!.lastName ?? ''}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // Role
                Text(
                  userProfileProvider.userModel!.role?.toUpperCase() ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 30),

                // Info List
                _buildInfoTile(
                    "Username", userProfileProvider.userModel!.username),
                _buildInfoTile("Email", userProfileProvider.userModel!.email),
                _buildInfoTile("Gender", userProfileProvider.userModel!.gender),
                _buildInfoTile(
                    "Access Token",
                    userProfileProvider.userModel!.accessToken != null
                        ? "Available"
                        : "Not Available"),
                _buildInfoTile(
                    "Refresh Token",
                    userProfileProvider.userModel!.refreshToken != null
                        ? "Available"
                        : "Not Available"),

                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add logout or edit functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                  ),
                  child: const Text("Logout"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoTile(String label, String? value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.w500)),
          Text(value ?? 'N/A',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
