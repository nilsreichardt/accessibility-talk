import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _MyAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 16),
                const _Card(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello Berlin! ❤️',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () => context.push('/unknown'),
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}

class _Card extends StatefulWidget {
  const _Card();

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const _Image(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const _CardTitle(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: ColoredBox(
                          color: Colors.orange,
                          child: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.grey[400]!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isExpanded ? const _CardDescription() : Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Text(
        'TUM > LMU',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CardDescription extends StatelessWidget {
  const _CardDescription();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: '01.01.',
            style: DefaultTextStyle.of(context).style,
            children: const [
              TextSpan(
                text: '1970',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const AutoSizeText(
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
          maxLines: 3,
        ),
        const SizedBox(height: 8),
        const _Code(),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/photo.jpg',
      height: 300,
      fit: BoxFit.cover,
      width: double.infinity,
      semanticLabel: 'A student doing some dance move.',
    );
  }
}

class _Code extends StatelessWidget {
  const _Code();

  @override
  Widget build(BuildContext context) {
    const code = 'COHl';
    return const Center(
      child: SizedBox(
        height: 50,
        width: 150,
        child: ColoredBox(
          color: Colors.orange,
          child: Center(
            child: ExcludeSemantics(
              child: Text(
                'Access code: $code',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
