using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Week7
{
    internal class CSVReader
    {
        public List<string[]> Read()// returns a list of fields to be inputted later
        {
            List<string[]> listLines = new List<string[]>();
            string[] files = Directory.GetFiles(Directory.GetCurrentDirectory() + "\\Files");
            foreach (var file in files)// Reads the file and outputs the contents into a string array
            {
                using (StreamReader sr = new StreamReader(file))
                {
                    sr.ReadLine();
                    while (!sr.EndOfStream)
                    {
                        string[] fields = sr.ReadLine().Split(',');
                        listLines.Add(fields);
                    }
                }
            }
            return listLines;
        }
    }
}
