#!/bin/sh

mkdir TEST_DIR
echo 'PENDING VIDEOS:' > TEST_LIST.txt
# in disk, not in list:
echo > TEST_DIR/v1.avi
echo > TEST_DIR/v1.mpg
# in disk, in list, not marked to delete:
echo > TEST_DIR/v2.avi
echo > TEST_DIR/v2.mpg
echo '- v2.avi' >> TEST_LIST.txt
echo '- v2.mpg' >> TEST_LIST.txt
# in disk, in list, marked to delete:
echo > TEST_DIR/v3.avi
echo > TEST_DIR/v3.mpg
echo 'x v3.avi' >> TEST_LIST.txt
echo 'x v3.mpg' >> TEST_LIST.txt
# not in disk, in list, not marked to delete:
echo '- v4.avi' >> TEST_LIST.txt
echo '- v4.mpg' >> TEST_LIST.txt
# not in disk, in list, marked to delete:
echo 'x v5.avi' >> TEST_LIST.txt
echo 'x v5.mpg' >> TEST_LIST.txt

echo 'PENDING VIDEOS:' > TEST_LIST_EXPECTED.txt
echo '- v2.avi' >> TEST_LIST_EXPECTED.txt
echo '- v2.mpg' >> TEST_LIST_EXPECTED.txt
echo 'x v3.avi' >> TEST_LIST_EXPECTED.txt
echo 'x v3.mpg' >> TEST_LIST_EXPECTED.txt
echo '- v4.avi' >> TEST_LIST_EXPECTED.txt
echo '- v4.mpg' >> TEST_LIST_EXPECTED.txt
echo 'x v5.avi' >> TEST_LIST_EXPECTED.txt
echo 'x v5.mpg' >> TEST_LIST_EXPECTED.txt
echo '- v1.avi' >> TEST_LIST_EXPECTED.txt
echo '- v1.mpg' >> TEST_LIST_EXPECTED.txt
echo 'FILES PENDING TO DELETE:' > TEST_OUTPUT_EXPECTED.txt
echo 'v3.avi' >> TEST_OUTPUT_EXPECTED.txt
echo 'v3.mpg' >> TEST_OUTPUT_EXPECTED.txt

perl update-videos.pl TEST_LIST.txt TEST_DIR > TEST_OUTPUT.txt

diff TEST_OUTPUT_EXPECTED.txt TEST_OUTPUT.txt
diff TEST_LIST_EXPECTED.txt TEST_LIST.txt

rm -f TEST_LIST.txt
rm -f TEST_LIST_EXPECTED.txt
rm -f TEST_OUTPUT.txt
rm -f TEST_OUTPUT_EXPECTED.txt
rm -f TEST_DIR/v1.avi
rm -f TEST_DIR/v1.mpg
rm -f TEST_DIR/v2.avi
rm -f TEST_DIR/v2.mpg
rm -f TEST_DIR/v3.avi
rm -f TEST_DIR/v3.mpg
rmdir TEST_DIR

