import 'dart:io';

void main() {
  final podfileContent = """
platform :ios, '15.0'
use_frameworks!
target 'Runner' do
  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
""";

  final podfile = File('ios/Podfile');
  podfile.writeAsStringSync(podfileContent);

  print('✅ Podfile generated successfully at ios/Podfile!');
}
