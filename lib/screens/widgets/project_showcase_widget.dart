import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/screens/widgets/text_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectShowcaseWidget extends StatefulWidget {
  final Size size;
  const ProjectShowcaseWidget({super.key, required this.size});
  @override
  State<ProjectShowcaseWidget> createState() => _ProjectShowcaseWidgetState();
}

class _ProjectShowcaseWidgetState extends State<ProjectShowcaseWidget> {
  // All fields explicitly typed and fallback safe
  final List<Map<String, dynamic>> _realProjects = [
    {
      'title': 'DeskFlow Dashboard',
      'description':
          'DeskFlow is a responsive, dual-theme desktop workspace dashboard engineered to monitor local development system performance, track workflow status, and manage active system configurations. Built as a fully decoupled full-stack application, it brings high-performance system insights into a clean, modern user interface.',
      'techStack': ['Flutter Web', 'Dart', 'Responsive UI'],
      'githubUrl': 'https://github.com/adrija-dev/DeskFlow',
      'imageAsset': 'assets/images/deskflow_dashboard.jpg',
      'isFrontendOnly': true,
    },
     {
      'title': 'Flutter Portfolio Website',
      'description': 'A production-grade, highly responsive developer portfolio website designed to scale flawlessly across mobile, tablet, and desktop viewports. Implements sleek dark-theme aesthetics, micro-interactions, custom layout animations, and optimized semantic structural blocks.',
      'techStack': ['Flutter Web', 'Dart', 'Responsive UI'],
      'githubUrl': 'https://github.com/adrija-dev', 
      'imageAsset': 'assets/images/portfolio.jpg',
    },
  ];

  final Map<int, bool> _hoveredStates = {};

  Future<void> _openProjectLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not redirect to $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widget.size.width;
    int crossAxisCount = 2;
    if (screenWidth <= 600) {
      crossAxisCount = 1;
    } else if (screenWidth > 950) {
      crossAxisCount = 2;
    }
    final int totalGridItems = _realProjects.length + 1;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: widget.size.height * 0.04,
        horizontal: screenWidth * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            sSize: widget.size,
            text: "Featured Projects",
            size: screenWidth > 600 ? 30 : 22,
            color: Colors.white,
            fw: FontWeight.bold,
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.studio,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 35),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalGridItems,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: screenWidth <= 600 ? 0.75 : 0.72,
            ),
            itemBuilder: (context, index) {
              final bool isHovered = _hoveredStates[index] ?? false;

              if (index == _realProjects.length) {
                return buildComingSoonCard(isHovered, index);
              }

              final project = _realProjects[index];

              final String projectTitle = (project['title'] ?? '').toString();
              final String projectDescription =
                  (project['description'] ?? '').toString();
              final String githubUrl = (project['githubUrl'] ?? '').toString();
              final String imageAsset =
                  (project['imageAsset'] ?? '').toString();
              final bool isFrontendOnly = project['isFrontendOnly'] ?? false;
              final List<String> techStack =
                  List<String>.from(project['techStack'] ?? []);

              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredStates[index] = true),
                onExit: (_) => setState(() => _hoveredStates[index] = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: isHovered
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.white.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isHovered
                          ? AppColors.studio
                          : Colors.white.withValues(alpha: 0.08),
                      width: 1.5,
                    ),
                    boxShadow: isHovered
                        ? [
                            BoxShadow(
                              color: AppColors.studio.withValues(alpha: 0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            )
                          ]
                        : [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.folderOpen,
                            size: 28,
                            color: isHovered
                                ? AppColors.paleSlate
                                : AppColors.studio,
                          ),
                          IconButton(
                            onPressed: () => _openProjectLink(githubUrl),
                            icon: const FaIcon(FontAwesomeIcons.github,
                                size: 22, color: Colors.white),
                            hoverColor: AppColors.studio.withValues(alpha: 0.3),
                            splashRadius: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        projectTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        projectDescription,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 13.5,
                          height: 1.6,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 16),

                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              if (imageAsset.isNotEmpty)
                                Image.asset(
                                  imageAsset,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.white.withValues(alpha: 0.05),
                                      child: const Center(
                                        child: Icon(Icons.broken_image,
                                            color: Colors.white24, size: 40),
                                      ),
                                    );
                                  },
                                )
                              else
                                Container(
                                    color: Colors.white.withValues(alpha: 0.05)),
                              if (isFrontendOnly)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(alpha: 0.75),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.amber.withValues(alpha: 0.5),
                                          width: 1),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.layers_outlined,
                                            color: Colors.amber, size: 12),
                                        SizedBox(width: 4),
                                        Text(
                                          "Frontend Demo",
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: techStack.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.studio.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.studio.withValues(alpha: 0.25)),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(
                                color: AppColors.paleSlate,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildComingSoonCard(bool isHovered, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredStates[index] = true),
      onExit: (_) => setState(() => _hoveredStates[index] = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isHovered
              ? AppColors.studio.withValues(alpha: 0.03)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered
                ? AppColors.studio.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.04),
            width: 1.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: isHovered ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: FaIcon(
                  FontAwesomeIcons.laptopCode,
                  size: 36,
                  color: isHovered
                      ? AppColors.paleSlate
                      : Colors.white.withValues(alpha: 0.15),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "More Projects Coming Soon",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      isHovered ? Colors.white : Colors.white.withValues(alpha: 0.4),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Actively exploring ideas and new tech packages...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.25),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
