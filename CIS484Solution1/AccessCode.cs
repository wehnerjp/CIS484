using System;
using System.Collections;

namespace CIS484Solution1
{
    public class AccessCode
    {
        private const string lower = "abcdefghijklmnopqursuvwxyz";
        private const string upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        private const string num = "123456789";
        private const string other = @"!@£$%^&*()#€";
        private ArrayList codeList = new ArrayList();

        public string GenerateCode(bool lowercase, bool uppercase, bool numbers, bool otherChar,
            int codeSize)
        {
            codeSize = 8;
            char[] code = new char[codeSize];
            string charSet = "";
            System.Random random = new Random();
            int counter;

            if (lowercase) charSet += lower;

            if (uppercase) charSet += upper;

            if (numbers) charSet += num;

            if (otherChar) charSet += other;

            for (counter = 0; counter < codeSize; counter++)
            {
                code[counter] = charSet[random.Next(charSet.Length - 1)];
            }
            bool Contains = codeList.Contains(code);
            if (!Contains)
            {
                codeList.Add(code);
            }
            else
            {
                GenerateCode(lowercase, uppercase, numbers, otherChar, codeSize);
            }
            return String.Join(null, code);
        }
    }
}