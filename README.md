# Uploader
Uploader for Pitta firmware file

1. Copy the Uploader folder to any directory on your PC
2. Disconnecting the communication cable with the 3D printer
3. Power on the Pitta base
4. Connect PC and Pitta base with USB serial cable
5. Open Windows Command Prompt at PC
6. Change directory to uploader folder
7. Copy firmware binary file to uploader folder
8. Run "uploader4pitta.bat firmware.hex" at Command Prompt

   ![uploader](https://user-images.githubusercontent.com/96027590/146873327-cd6f4dec-9353-479d-8f59-812ccccd4289.jpg)

   - Detect Pitta's COM port detect
   - Reset Pitta MCU
   - Detect Bootloader's COM Port

   ![uploader reset](https://user-images.githubusercontent.com/96027590/146873356-63b95384-625a-4973-bc64-56e4832feb9e.jpg)

   - Upload firmware file (Read -> Writing -> Verifying) to Pitta

9. Upload Complete

   ![upload complete](https://user-images.githubusercontent.com/96027590/146873594-7ef655e6-be52-448f-8445-c81f4cc1b7c9.jpg)
