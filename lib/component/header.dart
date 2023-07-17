import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZeenHeader extends StatefulWidget {
  const ZeenHeader({super.key});

  @override
  State<ZeenHeader> createState() => _ZeenHeaderState();
}

class _ZeenHeaderState extends State<ZeenHeader> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Image.asset(
            'assets/images/zeenlogoen-1.png',
            width: 124.36,
            height: 48,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            width: 304,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(12, 12, 44, 12),
                suffixIcon: IconButton(
                  onPressed: () {
                    // คำสั่งที่ต้องการเมื่อกดปุ่มค้นหา
                    // ...
                  },
                  icon: Icon(
                    Icons.search,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
