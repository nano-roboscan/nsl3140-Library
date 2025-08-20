# NSL-Library
NSL31X0-SDK library입니다.



## WINDOWS 컴파일 방법
- windows에서 shared library(.dll) 사용 시 NSLTOF_API=__declspec(dllimport)를 전처리 하여 사용하세요.
- 그 외의 static library 및 linux library는 별도의 전처리가 필요하지 않습니다.
- NSL31X0의 경우 USB와 Ethernet을 지원하며, Ethernet의 경우 컨트롤:TCP, 데이터:UDP를 사용합니다.
