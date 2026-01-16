# NSL-Library
NSL31X0-SDK library입니다.

## 인터페이스
- NSL 제품의 경우 USB(CDC/Vendor)와 Ethernet을 지원하며, Ethernet의 경우 컨트롤:TCP, 데이터:UDP를 사용합니다.

## WINDOWS
- windows에서 shared library(.dll) 사용 시 NSLTOF_API=__declspec(dllimport)를 전처리 하여 사용하세요.
- 그 외의 static library 및 linux library는 별도의 전처리가 필요하지 않습니다.

## LINUX 
- UBUNTU 18.04(gcc-7.5:aarch/x64) 에서 컴파일 되었습니다.
- 타 환경에서 dll이 필요한 경우 sales@nanosys.kr로 문의 바랍니다.

## MacOS 
- 해당 라이브러리들은 서명되지 않았습니다.
- application 개발 시 서명하여 사용 하십시오.

## libusb 설치를 위한 script 사용(linux/MacOS)
- 2026년 1월 이후 라이다 제품에 적용됨(firmware version : 3.16)
- windows는 자동 enumeration 됩니다.
- linux 및 macos 환경에서 script를 실행하여 libusb를 설치 후 사용하세요.
 - linux : sudo ./install_libusb_linux.sh
 - macos : ./install_libusb_macos.sh
