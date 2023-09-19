import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatefulWidget {
  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedRole = ''; // Track the selected role

  void selectRole(String role) {
    setState(() {
      selectedRole = role; // Set the selected role
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Image.asset(
                'assets/images/farm.png', // Replace with your image path
                height: 80),
          ),
          Text(
            'Welcome to our platform! Select your role to get started:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RoleButton(
                role: 'Farmer',
                imagePath: 'assets/images/farmer_icon.png',
                isSelected: selectedRole == 'Farmer',
                onSelect: selectRole,
              ),
              RoleButton(
                role: 'Expert',
                imagePath: 'assets/images/expert_icon.png',
                isSelected: selectedRole == 'Expert',
                onSelect: selectRole,
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              selectedRole.isNotEmpty
                  ? 'You have selected the role of $selectedRole.'
                  : 'Please select a role to continue.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: selectedRole.isNotEmpty
                ? () {
                    // Handle button tap based on selectedRole
                    if (selectedRole == 'Farmer') {
                      // Navigate to FarmerScreen
                      Navigator.pushNamed(context, 'FarmerLogin');
                    } else if (selectedRole == 'Expert') {
                      // Navigate to ExpertScreen
                      Navigator.pushNamed(context, 'ExpertScreen');
                    }
                  }
                : null, // Disable the button when no role is selected
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String role;
  final String imagePath;
  final bool isSelected;
  final Function(String) onSelect;

  RoleButton({
    required this.role,
    required this.imagePath,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(role); // Call the onSelect function with the selected role
      },
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 3.0,
              ),
            ),
            child: CircleAvatar(
              radius: 60,
              child: Container(
                child: Image.asset(imagePath, height: 100),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 10),
          Text(
            role,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
