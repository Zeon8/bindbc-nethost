using System;
using System.Runtime.InteropServices;

namespace DotNetLib
{
    public static class Lib
    {
        [UnmanagedCallersOnly]
        private static void Main()
        {
            Console.WriteLine("Hello from runtime!");
        }
    }
}