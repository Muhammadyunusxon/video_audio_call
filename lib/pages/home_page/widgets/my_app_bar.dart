import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget {
  final bool isAdd;
  VoidCallback? onAdd;
  VoidCallback? onSearch;

  MyAppBar({Key? key, this.isAdd = true, this.onAdd, this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 19),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border:
                        Border.all(color: const Color(0x406C6F82), width: 1)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        "https://image.pngaaa.com/0/2241000-middle.png")),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Your company",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(width: 7),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  ),
                  const Text(
                    "Workspace",
                    style: TextStyle(color: Color(0xff6C6F82)),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: onSearch, icon: const Icon(Icons.search)),
              isAdd
                  ? IconButton(
                      onPressed: onAdd,
                      icon: const Icon(Icons.add_box_outlined))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
