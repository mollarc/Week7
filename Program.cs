namespace Week7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            CSVReader reader = new CSVReader();
            TableSpeaker tableSpeaker = new TableSpeaker();
            List<string[]> list = new List<string[]>();
            list = reader.Read();
            tableSpeaker.ImportData(list);
            tableSpeaker.ReadAllData();
            tableSpeaker.FindLostCharacters();
            tableSpeaker.SwordNonHumans();
        }
    }
}