import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectItem extends StatefulWidget {
  final String initialWork;
  final Function()? onRemove;
  final Function(String)? onDuplicate;

  const ProjectItem({
    Key? key,
    required this.initialWork,
    this.onRemove,
    this.onDuplicate,
  }) : super(key: key);

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialWork);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    final day = DateFormat('E').format(now); // Mon, Tue, etc.
    final week = ((now.day - now.weekday + 10) / 7).floor(); // Approximate week of year
    return "$day, Wk $week";
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: _controller,
        decoration: const InputDecoration(border: InputBorder.none),
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(_getFormattedDate()),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'remove' && widget.onRemove != null) {
            widget.onRemove!();
          } else if (value == 'duplicate' && widget.onDuplicate != null) {
            widget.onDuplicate!(_controller.text);
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 'remove',
            child: Text('Remove'),
          ),
          const PopupMenuItem(
            value: 'duplicate',
            child: Text('Duplicate'),
          ),
        ],
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}
