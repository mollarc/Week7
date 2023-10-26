using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Week7
{
    internal class TableSpeaker
    {
        string sqlConStr;
        public TableSpeaker()
        {
            SqlConnectionStringBuilder mySqlConBldr = new SqlConnectionStringBuilder();
            mySqlConBldr["server"] = @"(localdb)\MSSQLLocalDB";
            mySqlConBldr["Trusted_Connection"] = true;
            mySqlConBldr["Integrated Security"] = "SSPI";
            mySqlConBldr["Initial Catalog"] = "PROG260FA23";
            sqlConStr = mySqlConBldr.ToString();
        }
        public void ImportData(List<string[]> listFields)// Imports data from the fields inputted
        {
            foreach (string[] fields in listFields)
            {

                using (SqlConnection conn = new SqlConnection(sqlConStr))
                {
                    conn.Open();
                    string inlineSQL = $@"INSERT INTO [dbo].[Characters_Unmodified] ([Character],[Type],[Map_Location],[Original_Character],[Sword_Fighter],[Magic_User]) VALUES (@paramChar,@paramType,@paramMap,@paramOC,@paramSword,@paramMagic)";
                    using (SqlCommand command = new SqlCommand(inlineSQL, conn))
                    {
                        command.Parameters.AddWithValue("@paramChar", fields[0]);
                        command.Parameters.AddWithValue("@paramType", String.IsNullOrEmpty(fields[1]) ? DBNull.Value : fields[1]); //https://stackoverflow.com/questions/55504761/c-sharp-sql-server-how-to-insert-dbnull-value-in-command-parameter-if-string and my friend Caroline stringisnullorempty and DBNull Value
                        command.Parameters.AddWithValue("@paramMap", String.IsNullOrEmpty(fields[2]) ? DBNull.Value : fields[2]);
                        command.Parameters.AddWithValue("@paramOC", String.IsNullOrEmpty(fields[3]) ? DBNull.Value : fields[3]);
                        command.Parameters.AddWithValue("@paramSword", String.IsNullOrEmpty(fields[4]) ? DBNull.Value : fields[4]);
                        command.Parameters.AddWithValue("@paramMagic", String.IsNullOrEmpty(fields[5]) ? DBNull.Value : fields[5]);
                        command.ExecuteNonQuery();
                    }
                    conn.Close();
                }
            }
        }

        public void ReadAllData()// joins all table data and outputs every column value for each key
        {
            FileStream fs = File.Create(Directory.GetCurrentDirectory() + "\\Files\\Full Report.txt");
            StreamWriter sw = new StreamWriter(fs);
            using (SqlConnection conn = new SqlConnection(sqlConStr))
            {
                conn.Open();
                string inlineSQL = @"Select ID, Character, Type, Map_Name, Original_Character, Sword_Fighter, Magic_User FROM [Characters] LEFT JOIN [Maps] ON [Characters].[Map_ID] = [Maps].[Map_ID] LEFT JOIN [Character_Details] ON [Characters].[Character_Details_ID] = [Character_Details].[Character_Details_ID]";
                using (var command = new SqlCommand(inlineSQL, conn))
                {
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var value = $"{reader.GetValue(0)},{reader.GetValue(1)},{reader.GetValue(2).ToString()},{reader.GetValue(3).ToString()},{reader.GetValue(4).ToString()},{reader.GetValue(5).ToString()},{reader.GetValue(6).ToString()}";
                        Console.WriteLine(value);
                        sw.WriteLine(value);
                    }
                    reader.Close();
                }
                sw.Close();
                fs.Close();
                conn.Close();
            }
        }

        public void FindLostCharacters()// Finds characters that have no location and outputs their name
        {
            FileStream fs = File.Create(Directory.GetCurrentDirectory() + "\\Files\\Lost.txt");
            StreamWriter sw = new StreamWriter(fs);
            using (SqlConnection conn = new SqlConnection(sqlConStr))
            {
                conn.Open();
                string inlineSQL = @"Select Character, Map_Name FROM [Characters] LEFT JOIN [Maps] ON [Characters].[Map_ID] = [Maps].[Map_ID] WHERE [Maps].[Map_ID] IS NULL";
                using (var command = new SqlCommand(inlineSQL, conn))
                {
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var value = $"{reader.GetValue(0)},{reader.GetValue(1).ToString()}";
                        Console.WriteLine(value);
                        sw.WriteLine(value);
                    }
                    reader.Close();
                }
                sw.Close();
                fs.Close();
                conn.Close();
            }
        }

        public void SwordNonHumans()// Finds characters who use swords and are not humans and outputs their name type and if they are a sword fighter
        {
            FileStream fs = File.Create(Directory.GetCurrentDirectory() + "\\Files\\SwordNonHuman.txt");
            StreamWriter sw = new StreamWriter(fs);
            using (SqlConnection conn = new SqlConnection(sqlConStr))
            {
                conn.Open();
                string inlineSQL = @"Select Character, Type, Sword_Fighter FROM [Characters] LEFT JOIN [Character_Details] ON [Characters].[Character_Details_ID] = [Character_Details].[Character_Details_ID] WHERE [Character_Details].[Sword_Fighter] = 'TRUE' AND [Characters].[Type] !='Human'";
                using (var command = new SqlCommand(inlineSQL, conn))
                {
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var value = $"{reader.GetValue(0)},{reader.GetValue(1).ToString()},{reader.GetValue(2).ToString()}";
                        Console.WriteLine(value);
                        sw.WriteLine(value);
                    }
                    reader.Close();
                }
                sw.Close();
                fs.Close();
                conn.Close();
            }
        }
    }
}

