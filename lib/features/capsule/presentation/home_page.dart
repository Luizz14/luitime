import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luitime/services/notification_service.dart';
import 'package:luitime/widgets/animated_text.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'dart:async';
import 'dart:ui'; // Para o ImageFiltered

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    super.initState();
    _currentTime = DateTime.now();

    // Atualiza o timer para iniciar no próximo minuto exato
    var nextMinute = _currentTime.add(
      Duration(
        minutes: 1,
        seconds: -_currentTime.second,
        milliseconds: -_currentTime.millisecond,
      ),
    );
    var delay = nextMinute.difference(_currentTime);

    // Timer inicial para sincronizar com o próximo minuto
    Timer(delay, () {
      // Atualiza o tempo imediatamente
      setState(() => _currentTime = DateTime.now());

      // Inicia o timer periódico
      _timer = Timer.periodic(
        const Duration(minutes: 1),
        (_) => setState(() => _currentTime = DateTime.now()),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    // Formata as horas e minutos com zeros à esquerda
    final hours = _currentTime.hour.toString().padLeft(2, '0');
    final minutes = _currentTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 800,
          ),
          width: 700,
          height: 300,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          decoration: ShapeDecoration(
            color: theme.surfaceContainer,
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(74),
              smoothness: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hours,
                style: TextStyle(
                  fontSize: 190,
                  color: theme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                ':',
                style: TextStyle(
                  fontSize: 190,
                  color: theme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              buildAnimatedText(minutes, theme.onSurface),
            ],
          ),
        ),
      ),
    );
  }
}
