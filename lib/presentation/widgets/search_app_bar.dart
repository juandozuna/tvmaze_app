import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String? searchPlaceholder;
  final void Function(String)? onSearch;

  const SearchAppBar({
    Key? key,
    required this.title,
    this.searchPlaceholder,
    this.onSearch,
  }) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching ? _buildSearchField() : Text(widget.title),
      actions: [
        if (widget.onSearch != null)
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              onBtnPressed();
            },
          ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppValues.defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.searchFieldBackground,
        borderRadius: BorderRadius.circular(AppValues.defaultBorderRadius),
      ),
      child: TextField(
        onSubmitted: (value) {
          widget.onSearch!(value);
          setState(() {
            _isSearching = false;
          });
        },
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.searchPlaceholder ?? translate('search'),
        ),
      ),
    );
  }

  void onBtnPressed() {
    if (!_isSearching) {
      setSearch();
    } else {
      doClearSearch();
    }
  }

  void setSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void doClearSearch() {
    setState(() {
      _isSearching = false;
    });
    //TODO: do clear
  }
}
