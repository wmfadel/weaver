clean:
	flutter clean
	rm -f pubspec.lock
	cd ios
	rm -f Podfile.lock
	cd ..

get:
	pwd
	cd ios
	pwd
	flutter pub get
	pod install
	cd ..

all: clean get

