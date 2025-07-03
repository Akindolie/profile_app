import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.work_outline,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Featured Projects',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildProjectCard(
                context,
                'Cordros Asset Management',
                'assets/images/cordros.png',
                'A web portal that allow customers view their portfolio standings',
                ['Oracle APEX', 'Oracle DB', 'API'],
                'assets/images/project3.jpg',
              ),
              const SizedBox(height: 20),
              _buildProjectCard(
                context,
                'Stocka',
                'assets/images/stocka.png',
                'Stocka is a risk-free, accessible platform that allows users to explore and invest in Nigerian equities through simulations and what-if analyses without needing upfront capital.',
                ['Flutter', 'Firebase', 'REST APIs', 'Push Notification'],
                'assets/images/project1.jpg',
              ),
              const SizedBox(height: 16),
              _buildProjectCard(
                context,
                'Biscuit Beacon',
                'assets/images/biscuit_beacon.png',
                'An app helps users find and share pet-friendly spots like treat jars and water bowls, using a gamified system to encourage community involvement during dog walks.',
                ['Flutter', 'APIs', 'Location'],
                'assets/images/project2.jpg',
              ),

              const SizedBox(height: 16),
              _buildProjectCard(
                context,
                'Osun State HR/PAYROLL',
                'assets/images/sifmis.png',
                'An ERP for Human Resource and Payroll management',
                ['Oracle APEX', 'Oracle DB', 'API'],
                'assets/images/project3.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String imageUrl,
    String description,
    List<String> technologies,
    String imagePath,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),

            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fill,
                ),
                // border: BoxBorder.all(color: Colors.grey, width: 0.1),
                color: Colors.grey[300],
              ),
              height: 120,
              width: double.infinity,

              //child: const Icon(Icons.image, size: 40, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: technologies
                      .map((tech) => _buildTechChip(context, tech))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(BuildContext context, String technology) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        technology,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
