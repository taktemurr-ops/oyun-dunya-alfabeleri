import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dunya_alfabeleri/oyun_dunya_alfabeleri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dunyaAlfabeleriConfig.title.length, 33);
    expect(dunyaAlfabeleriConfig.tagline.length, 33);
    for (final s in dunyaAlfabeleriConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dunyaAlfabeleriConfig.gameId, dunyaAlfabeleriId);
    expect(dunyaAlfabeleriRules.gameId, dunyaAlfabeleriId);
    expect(dunyaAlfabeleriConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dunyaAlfabeleriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dunyaAlfabeleriId, optionalMechanics: dunyaAlfabeleriRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dunyaAlfabeleriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
