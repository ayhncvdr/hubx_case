import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/theme/plant_color_extension.dart';
import 'package:hubx_case/core/theme/plant_dimens.dart';
import 'package:hubx_case/core/theme/plant_radii.dart';
import 'package:hubx_case/features/home/domain/entities/category.dart';
import 'package:hubx_case/features/home/domain/entities/question.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:hubx_case/features/home/presentation/ui/home_error_view.dart';
import 'package:hubx_case/features/home/presentation/ui/home_loading_view.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/utils/plant_assets.dart';
import 'package:hubx_case/shared/utils/url_launcher_helper.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';
import 'package:hubx_case/shared/widgets/plant_image.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

abstract class _Constants {
  static const double questionCardWidth = 240;
  static const double questionCardHeight = 164;
  static const double questionTitleContainerHeight = 64;
  static const int categoriesGridCrossAxisCount = 2;
  static const double categoryCardSize = 152;
  static const double categoriesGridSpacing = 12;
  static const double categoryCardBorderWidth = 0.5;
  static const double categoryTitleContainerWidth = 80;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const HomeLoadingView();
        }

        if (state.failure != null) {
          return HomeErrorView(error: state.failure!.message);
        }

        return HomeSuccessView(questions: state.questions, categories: state.categories);
      },
    );
  }
}

class HomeSuccessView extends StatelessWidget {
  const HomeSuccessView({required this.questions, required this.categories, super.key});

  final List<Question> questions;
  final List<Category> categories;

  BoxDecoration _bodyDecoration(BuildContext context) => BoxDecoration(
        color: context.plantColors.primaryBackground,
      );

  LinearGradient _bannerGradient(BuildContext context) => LinearGradient(
        colors: [
          Theme.of(context).colorScheme.secondaryContainer,
          Theme.of(context).colorScheme.tertiary,
        ],
      );

  BoxDecoration _searchBarDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(PlantRadii.x12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0.2,
        ),
      );

  BoxDecoration _premiumBannerDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(PlantRadii.x12),
      );

  BoxDecoration _questionTitleDecoration(BuildContext context) => BoxDecoration(
        color: context.plantColors.questionTitleBackground,
        border: Border.all(
          color: context.plantColors.questionTitleBorder,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(PlantRadii.x12),
          bottomRight: Radius.circular(PlantRadii.x12),
        ),
      );

  BoxDecoration _categoryCardDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(PlantRadii.x12),
        border: Border.all(
          color: context.plantColors.categoryCardBorder,
          width: _Constants.categoryCardBorderWidth,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: DecoratedBox(
          decoration: _bodyDecoration(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(context),
                      Column(
                        children: [
                          _buildPremiumBanner(context).paddingOnly(bottom: PlantDimens.x24),
                          _buildQuestionsList(context, questions).paddingOnly(bottom: PlantDimens.x24),
                          _buildCategoriesList(context, categories),
                        ],
                      ).paddingSymmetric(horizontal: PlantDimens.x20, vertical: PlantDimens.x24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        const PlantImage(
          assetPath: PlantAssets.homeBackground,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: PlantDimens.x16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildGreeting(context).paddingOnly(bottom: PlantDimens.x16),
              _buildSearchBar(context),
            ],
          ).paddingSymmetric(horizontal: PlantDimens.x20),
        ),
      ],
    );
  }

  Widget _buildGreeting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlantText(
          L.home.greetingPrefix,
          style: PlantTextStyles.body16Regular(context),
        ).paddingOnly(bottom: PlantDimens.x8),
        PlantText(
          L.home.greetingSuffix,
          style: PlantTextStyles.headline24Medium(context),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final plantColors = context.plantColors;
    return DecoratedBox(
      decoration: _searchBarDecoration(context),
      child: TextField(
        decoration: InputDecoration(
          hintText: L.home.searchHint,
          hintStyle: PlantTextStyles.body14Regular(context).copyWith(
            color: plantColors.searchHint,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: plantColors.searchHint,
            size: PlantDimens.x24,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: PlantDimens.x16,
            vertical: PlantDimens.x12,
          ),
        ),
        style: PlantTextStyles.body14Regular(context),
      ),
    );
  }

  Widget _buildPremiumBanner(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bannerGradient = _bannerGradient(context);
    return InkWell(
      onTap: () {
        context.push('/paywall');
      },
      borderRadius: BorderRadius.circular(PlantRadii.x12),
      child: DecoratedBox(
        decoration: _premiumBannerDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PlantImage(
              assetPath: PlantAssets.homePremiumOfferIcon,
              width: PlantDimens.x40,
              height: PlantDimens.x40,
              fit: BoxFit.fitWidth,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => bannerGradient.createShader(bounds),
                    child: PlantText(
                      L.home.premiumBannerTitle,
                      style: PlantTextStyles.title16Medium(context).copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                  PlantText(
                    L.home.premiumBannerSubtitle,
                    style: PlantTextStyles.body12Regular(context).copyWith(
                      color: colorScheme.secondaryContainer,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: PlantDimens.x12),
            ),
            const PlantImage(
              assetPath: PlantAssets.homePremiumChevronRight,
              width: PlantDimens.x24,
              height: PlantDimens.x24,
            ),
          ],
        ).paddingSymmetric(vertical: PlantDimens.x12, horizontal: PlantDimens.x16),
      ),
    );
  }

  Widget _buildQuestionsList(BuildContext context, List<Question> questions) {
    return SizedBox(
      height: _Constants.questionCardHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        itemBuilder: (ctx, index) {
          return _buildQuestionCard(context, questions[index]).paddingOnly(
            end: index < questions.length - 1 ? PlantDimens.x12 : 0,
          );
        },
      ),
    );
  }

  Widget _buildQuestionCard(BuildContext context, Question question) {
    final plantColors = context.plantColors;
    return InkWell(
      onTap: () {
        UrlLauncherHelper.launchQuestionUrl(question.uri);
      },
      borderRadius: BorderRadius.circular(PlantRadii.x12),
      child: SizedBox(
        width: _Constants.questionCardWidth,
        height: _Constants.questionCardHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(PlantRadii.x12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildQuestionImage(context, question.imageUri),
              Container(color: plantColors.questionCardOverlay),
              _buildQuestionTitle(context, question.title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionImage(BuildContext context, String? imageUri) {
    final outlineColor = Theme.of(context).colorScheme.outline;
    if (imageUri != null) {
      return Image.network(
        imageUri,
        fit: BoxFit.cover,
        errorBuilder: (ctx, error, stackTrace) {
          return Container(color: outlineColor);
        },
      );
    }
    return Container(color: outlineColor);
  }

  Widget _buildQuestionTitle(BuildContext context, String? title) {
    final colorScheme = Theme.of(context).colorScheme;
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: _Constants.questionTitleContainerHeight,
        decoration: _questionTitleDecoration(context),
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: PlantDimens.x12,
          vertical: PlantDimens.x8,
        ),
        child: title != null
            ? PlantText(
                title,
                style: PlantTextStyles.title16Medium(context).copyWith(
                  color: colorScheme.surface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildCategoriesList(BuildContext context, List<Category> categories) {
    return GridView.builder(
      padding: EdgeInsetsDirectional.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _Constants.categoriesGridCrossAxisCount,
        crossAxisSpacing: _Constants.categoriesGridSpacing,
        mainAxisSpacing: _Constants.categoriesGridSpacing,
      ),
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        return SizedBox(
          width: _Constants.categoryCardSize,
          height: _Constants.categoryCardSize,
          child: _buildCategoryCard(context, categories[index]),
        );
      },
    );
  }

  Widget _buildCategoryCard(BuildContext context, Category category) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        /* No operation */
      },
      borderRadius: BorderRadius.circular(PlantRadii.x12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: _categoryCardDecoration(context),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(PlantRadii.x12 - _Constants.categoryCardBorderWidth),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius:
                    const BorderRadius.all(Radius.circular(PlantRadii.x12 - _Constants.categoryCardBorderWidth)),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (category.image?.url != null)
                    Image.network(
                      category.image!.url!,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, error, stackTrace) {
                        return const SizedBox.shrink();
                      },
                    ),
                  Positioned(
                    left: PlantDimens.x16 - _Constants.categoryCardBorderWidth,
                    top: PlantDimens.x16 - _Constants.categoryCardBorderWidth,
                    child: SizedBox(
                      width: _Constants.categoryTitleContainerWidth,
                      child: PlantText(
                        category.title ?? '',
                        style: PlantTextStyles.title16Medium(context),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).paddingAll(_Constants.categoryCardBorderWidth),
        ],
      ),
    );
  }
}
