import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  Widget buildLeadingNavbar() {
    return GestureDetector(
      onTap: () {},
      child: const Icon(
        Icons.view_compact_rounded,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  Widget buildTrailingSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.search_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: buildLeadingNavbar(),
      actions: [
        buildTrailingSearchBar(context),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
