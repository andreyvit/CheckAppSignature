#! /bin/bash
VERSION="1.0"
FILE="$1"
DIR=""

echo "CheckAppSignature v.$VERSION."
echo "© 2011, Andrey Tarantsov"
echo "https://github.com/andreyvit/CheckAppSignature"
echo ""

if test -z "$FILE"; then
    echo "Please drag'n'drop IPA or APP into this window."
    exit 1
fi

case $FILE in
    *.ipa)
        echo "Drag'n'dropped IPA: $(basename "$FILE")."
        DIR="$(mktemp -d -t checkappsig)"
        cd "$DIR"
        echo "Unzipping IPA into a temp directory..."
        unzip -q "$FILE"

        APP=""
        for i in $DIR/Payload/*.app; do APP="$i"; done
        if test -z "$APP"; then
            echo "Cannot find .app inside the given .ipa"
            exit 1
        fi
        echo "Found APP: $(basename "$APP")."
        ;;

    *.app)
        APP="$FILE"
        echo "Drag'n'dropped APP: $(basename "$FILE")."
        ;;

    *)
        echo "Unknown file format: $(basename "$FILE")"
        exit 1
esac

echo "Reading code signature..."
echo ""
echo "============================================================"
codesign -dvvv "$APP"
echo "============================================================"
echo ""
echo "Done."

test -n "$DIR" && rm -rf "$DIR"
