import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/theme/plant_colors.dart';
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

        if (state.error != null) {
          return HomeErrorView(error: state.error!);
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

  static const _bodyDecoration = BoxDecoration(
    color: PlantColors.primaryBackground,
  );

  static const _bannerGradient = LinearGradient(
    colors: [
      PlantColors.bannerTextGradient1,
      PlantColors.bannerTextGradient2,
    ],
  );

  static final _searchBarDecoration = BoxDecoration(
    color: PlantColors.white,
    borderRadius: BorderRadius.circular(PlantRadii.x12),
    border: Border.all(
      color: PlantColors.searchBorder,
      width: 0.2,
    ),
  );

  static final _premiumBannerDecoration = BoxDecoration(
    color: PlantColors.bannerBackground,
    borderRadius: BorderRadius.circular(PlantRadii.x12),
  );

  static final _questionTitleDecoration = BoxDecoration(
    color: PlantColors.questionTitleBackground,
    border: Border.all(
      color: PlantColors.questionTitleBorder,
    ),
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(PlantRadii.x12),
      bottomRight: Radius.circular(PlantRadii.x12),
    ),
  );

  static final _categoryCardDecoration = BoxDecoration(
    color: PlantColors.white,
    borderRadius: BorderRadius.circular(PlantRadii.x12),
    border: Border.all(
      color: PlantColors.categoryCardBorder,
      width: _Constants.categoryCardBorderWidth,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      body: DecoratedBox(
        decoration: _bodyDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    Column(
                      children: [
                        _buildPremiumBanner(context).paddingOnly(bottom: PlantDimens.x24),
                        _buildQuestionsList(questions).paddingOnly(bottom: PlantDimens.x24),
                        _buildCategoriesList(categories),
                      ],
                    ).paddingSymmetric(horizontal: PlantDimens.x20, vertical: PlantDimens.x24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
              _buildGreeting().paddingOnly(bottom: PlantDimens.x16),
              _buildSearchBar(),
            ],
          ).paddingSymmetric(horizontal: PlantDimens.x20),
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlantText(
          L.home.greetingPrefix,
          style: PlantTextStyles.body16Regular,
        ).paddingOnly(bottom: PlantDimens.x8),
        PlantText(
          L.home.greetingSuffix,
          style: PlantTextStyles.headline24Medium,
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return DecoratedBox(
      decoration: _searchBarDecoration,
      child: TextField(
        decoration: InputDecoration(
          hintText: L.home.searchHint,
          hintStyle: PlantTextStyles.body14Regular.copyWith(
            color: PlantColors.searchHint,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: PlantColors.searchHint,
            size: PlantDimens.x24,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: PlantDimens.x16,
            vertical: PlantDimens.x12,
          ),
        ),
        style: PlantTextStyles.body14Regular,
      ),
    );
  }

  Widget _buildPremiumBanner(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/paywall');
      },
      borderRadius: BorderRadius.circular(PlantRadii.x12),
      child: DecoratedBox(
        decoration: _premiumBannerDecoration,
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
                    shaderCallback: (bounds) => _bannerGradient.createShader(bounds),
                    child: PlantText(
                      L.home.premiumBannerTitle,
                      style: PlantTextStyles.title16Medium.copyWith(
                        color: PlantColors.white,
                      ),
                    ),
                  ),
                  PlantText(
                    L.home.premiumBannerSubtitle,
                    style: PlantTextStyles.body12Regular.copyWith(
                      color: PlantColors.bannerTextGradient1,
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

  Widget _buildQuestionsList(List<Question> questions) {
    return SizedBox(
      height: _Constants.questionCardHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return _buildQuestionCard(questions[index]).paddingOnly(
            end: index < questions.length - 1 ? PlantDimens.x12 : 0,
          );
        },
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
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
              _buildQuestionImage(question.imageUri),
              Container(color: PlantColors.questionCardOverlay),
              _buildQuestionTitle(question.title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionImage(String? imageUri) {
    if (imageUri != null) {
      return Image.network(
        imageUri,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(color: PlantColors.searchBorder);
        },
      );
    }
    return Container(color: PlantColors.searchBorder);
  }

  Widget _buildQuestionTitle(String? title) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: _Constants.questionTitleContainerHeight,
        decoration: _questionTitleDecoration,
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: PlantDimens.x12,
          vertical: PlantDimens.x8,
        ),
        child: title != null
            ? PlantText(
                title,
                style: PlantTextStyles.title16Medium.copyWith(
                  color: PlantColors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildCategoriesList(List<Category> categories) {
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
      itemBuilder: (context, index) {
        return SizedBox(
          width: _Constants.categoryCardSize,
          height: _Constants.categoryCardSize,
          child: _buildCategoryCard(categories[index]),
        );
      },
    );
  }

  Widget _buildCategoryCard(Category category) {
    return InkWell(
      onTap: () {
        /* No operation */
      },
      borderRadius: BorderRadius.circular(PlantRadii.x12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: _categoryCardDecoration,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(PlantRadii.x12 - _Constants.categoryCardBorderWidth),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: PlantColors.white,
                borderRadius: BorderRadius.all(Radius.circular(PlantRadii.x12 - _Constants.categoryCardBorderWidth)),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (category.image?.url != null)
                    Image.network(
                      category.image!.url!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
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
                        style: PlantTextStyles.title16Medium,
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
