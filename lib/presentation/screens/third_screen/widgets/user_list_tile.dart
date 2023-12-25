import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/user_model.dart';

class UserListTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onTap;

  const UserListTile({
    super.key,
    required this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              foregroundImage: CachedNetworkImageProvider(
                user.avatar ?? 'https://via.placeholder.com/150',
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  user.email ?? '-',
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
