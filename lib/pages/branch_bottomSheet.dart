import 'package:flutter/material.dart';

class BranchBottomSheet extends StatefulWidget {
  final String selectedBranch;
  final Function(String) onSelectBranch;

  const BranchBottomSheet({
    super.key,
    required this.selectedBranch,
    required this.onSelectBranch,
  });

  @override
  BranchBottomSheetState createState() => BranchBottomSheetState();
}

class BranchBottomSheetState extends State<BranchBottomSheet> {
  late String _selectedBranch;

  @override
  void initState() {
    super.initState();
    _selectedBranch = widget.selectedBranch;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sort by',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 20,
          ),
          _buildBranchTile(
            title: 'Bachelor of Technology',
            icon: Icons.school,
            value: 'Branch 1',
          ),
          _buildBranchTile(
            title: 'Bachelor of Architecture',
            icon: Icons.engineering,
            value: 'Branch 2',
          ),
          _buildBranchTile(
            title: 'Pharmacy',
            icon: Icons.local_pharmacy,
            value: 'Branch 3',
          ),
          _buildBranchTile(
            title: 'Law',
            icon: Icons.gavel,
            value: 'Branch 4',
          ),
          _buildBranchTile(
            title: 'Management',
            icon: Icons.business,
            value: 'Branch 5',
          ),
        ],
      ),
    );
  }

  ListTile _buildBranchTile({required String title, required IconData icon, required String value}) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedBranch,
        onChanged: (newValue) {
          setState(() {
            _selectedBranch = newValue!;
            widget.onSelectBranch(_selectedBranch);
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }
}
