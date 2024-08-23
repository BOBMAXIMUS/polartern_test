import 'package:flutter/material.dart';

import '../screens/success_screen.dart';

class ButtonDisplayWidget extends StatefulWidget {
  final VoidCallback? onNavigate;
  final Duration delayDuration;

  const ButtonDisplayWidget({
    super.key,
    this.onNavigate,
    this.delayDuration = const Duration(seconds: 1),
  });

  @override
  ButtonDisplayWidgetState createState() => ButtonDisplayWidgetState();
}

class ButtonDisplayWidgetState extends State<ButtonDisplayWidget> {
  double _sliderValue = 0.0;
  bool _isRSVPed = false;

  void _onSliderChange(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _onSliderChangeEnd(double value) {
    if (value < 1.0) {
      setState(() {
        _sliderValue = 0.0;
      });
    } else if (value == 1.0) {
      setState(() {
        _isRSVPed = true;
      });
      _navigateWithDelay();
    }
  }

  void _navigateWithDelay() {
    Future.delayed(
      widget.delayDuration,
      () {
        if (mounted) {
          if (widget.onNavigate != null) {
            widget.onNavigate!();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CongratulationsScreen(),
              ),
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF5AA1C2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                _isRSVPed ? "RSVP'd" : "Swipe to RSVP",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 20),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                trackHeight: 0.0,
                activeTrackColor: Colors.transparent,
                inactiveTrackColor: Colors.transparent,
              ),
              child: Slider(
                value: _sliderValue,
                onChanged: _isRSVPed ? null : _onSliderChange,
                onChangeEnd: _isRSVPed ? null : _onSliderChangeEnd,
                activeColor: Colors.transparent,
                inactiveColor: Colors.transparent,
                thumbColor: Colors.white,
              ),
            ),
          ),
          if (_sliderValue > 0.0 && !_isRSVPed)
            const Positioned(
              right: 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(6, 6, 3, 6),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.check,
                    color: Color(0xFF5AA1C2),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
