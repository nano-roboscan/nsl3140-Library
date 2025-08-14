# NSL-Library
NSL31X0-SDK library입니다.



## WINDOWS 컴파일 방법
- windows에서 shared library(.dll) 사용 시 NSLTOF_API=__declspec(dllimport)를 전처리 하여 사용하세요.
- 그 외의 static library 및 linux library는 별도의 전처리가 필요하지 않습니다.
