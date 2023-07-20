import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:example/features/countries/entity/country_entity.dart';
import 'package:example/features/countries/presentation/screens/country_list_screen/country_list_screen_wm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:union_state/union_state.dart';

/// Widget screen with list of countries.
class CountryListScreen extends ElementaryWidget<ICountryListWM> {
  const CountryListScreen(
    WidgetModelFactory<CountryListScreenWm> super.wmFactory, {
    super.key,
  });

  @override
  Widget build(ICountryListWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country list'),
      ),
      body: UnionStateListenableBuilder<Iterable<CountryEntity>>(
          unionStateListenable: wm.countryListState,
          loadingBuilder: (_, __) => const _LoadingWidget(),
          builder: (_, countries) => _CountryList(
                countries: countries,
                nameStyle: wm.countryNameStyle,
                onRefresh: wm.onRefresh,
              ),
          failureBuilder: (_, failure, __) {
            log('failure: $failure');
            return const _ErrorWidget();
          }),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}

class _CountryList extends StatelessWidget {
  final Iterable<CountryEntity>? countries;
  final TextStyle nameStyle;
  final AsyncCallback onRefresh;

  const _CountryList({
    required this.countries,
    required this.nameStyle,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final countries = this.countries;

    if (countries == null || countries.isEmpty) {
      return const _EmptyList();
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        itemBuilder: (_, index) => _CountryWidget(
          data: countries.elementAt(index),
          countryNameStyle: nameStyle,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: countries.length,
        cacheExtent: 800,
      ),
    );
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('List is empty'),
    );
  }
}

class _CountryWidget extends StatelessWidget {
  final CountryEntity data;
  final TextStyle countryNameStyle;

  const _CountryWidget({
    required this.data,
    required this.countryNameStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              transform: Matrix4.rotationZ(-0.2)
                ..scale(1.2)
                ..translate(-50.0),
              height: 250,
              width: double.infinity,
              child: Image.network(
                data.flag,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    const Spacer(),
                    Container(
                      constraints: constraints.copyWith(minWidth: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white70,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        data.name,
                        style: countryNameStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
