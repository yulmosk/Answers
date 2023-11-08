import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sun_stickers/ui/_ui.dart';

import '../../data/_data.dart';
import '../../states/_states.dart';
import '../../ui_kit/_ui_kit.dart';

class StickerList extends StatelessWidget {
  StickerList({super.key});
  //var categories = AppData.categories;


  @override
  Widget build(BuildContext context) {
    debugPrint('StickerList >> Перерисовка всего экрана');
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Morning, Sunny",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "What sticker do you want\nto buy today",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              _searchBar(),
              Text(
                "Available for you",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              _categories(context),
              Builder(
                  builder: (context) {
                    debugPrint('StickerList >> Фильтрация категорий');
                    //final stickersByCategory = context.watch<SharedBloc>().state.stickersByCategory;
                    final stickersByCategory = context.select((SharedBloc b) => b.state.stickersByCategory);
                    return StickerListView(stickers: stickersByCategory);
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best stickers of the week",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "See all",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColor.accent),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                  builder: (context) {
                    debugPrint('StickerList >> Лучшие предложения недели');
                    context.select((SharedBloc b) => b.state.stickers.length);
                    final stickers = context.read<SharedBloc>().state.stickers;
                    //final stickers = context.watch<SharedBloc>().state.stickers;
                    return StickerListView(
                      stickers: stickers,
                      isReversed: true,
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.dice),
        onPressed: () => context.read<SharedBloc>().add(ToggleThemeTabEvent()),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined, color: AppColor.accent),
          Text(
            "Location",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            badgeStyle: const BadgeStyle(badgeColor: AppColor.accent),
            badgeContent: const Text(
              "2",
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topStart(start: -3),
            child: const Icon(Icons.notifications_none, size: 30),
          ),
        )
      ],
    );
  }

  Widget _searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search sticker',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _categories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 40,
        child: Builder(
          builder: (context) {
            //final categories = context.watch<SharedBloc>().state.categories;
            final categoiesLength = context.select((SharedBloc b) => b.state.categories.length);
            debugPrint('StickerList >> Изменение длины списка категории');
            //final categories = context.select((SharedBloc b) => b.state.categories);
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {

                  return Builder(
                    builder: (context) {
                      final isSelected = context.select((SharedBloc b) => b.state.categories[index].isSelected);
                      final category = context.read<SharedBloc>().state.categories[index];
                      debugPrint('StickerList >> Перерисовка категории ${category.type}');
                      return GestureDetector(
                        onTap: (){
                          context.read<SharedBloc>().add(CategoryTapEvent(category));
                        },
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //color: category.isSelected ? AppColor.accent : Colors.transparent,
                            color: isSelected ? AppColor.accent : Colors.transparent,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            category.type.name.firstCapital,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      );
                    }
                  );
                },
                separatorBuilder: (_, __) => Container(
                      width: 15,
                    ),
                itemCount: categoiesLength);
          }
        ),
      ),
    );
  }
}
