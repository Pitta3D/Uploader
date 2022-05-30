# Uploader
Uploader for Pitta firmware file

1. Copy the Uploader folder to any directory on your PC
2. Disconnecting the communication cable with the 3D printer
3. Power on the Pitta base
4. Connect PC and Pitta base with USB serial cable
5. Check and record VID and PID numbers in Device Manager

   ![device](https://user-images.githubusercontent.com/96027590/171066714-6be7d49a-185e-4878-bcc3-f0e1faae6b1d.jpg)

6. Open Windows Command Prompt at PC
7. Change directory to uploader tool folder
8. Copy firmware binary file to uploader tool folder
9. Run "uploader4pitta.bat VID PID firmware" at Command Prompt (ex. uploader4pitta.bat 2341 8037 firmware.hex)

   ![Screenshot 2022-05-30 173818](https://user-images.githubusercontent.com/96027590/171066827-7d8df703-e556-4612-845d-ad895ef30090.jpg)

   - Detect Pitta's COM port detect
   - Reset Pitta MCU
   - Detect Bootloader's COM Port

      ![Screenshot 2022-05-30 174058](https://user-images.githubusercontent.com/96027590/171066902-67b220a4-50ba-4a70-87d2-0a58c7c5d608.jpg)

   - Upload firmware file (Read -> Writing -> Verifying) to Pitta

10. Upload Complete

      ![complete](https://user-images.githubusercontent.com/96027590/171067110-3418f2d5-ef34-4814-96c8-f0ea97b9cd15.jpg)
