using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace OOP_CheWeiHsuTask13
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Server=可愛許家\\SQLEXPRESS;Database=Dentist;Trusted_Connection=true;";
            using (SqlConnection sqlConnection= new SqlConnection(connectionString))
            {
                try
                {
                    sqlConnection.Open();
                    string sql = "UPDATE Dentist SET TelNum=@TelNum WHERE Name=@Name";
                    //string sql = "DELETE FROM Dentist WHERE Name=@Name";
                    //string sql = "INSERT INTO Dentist(Name, TelNum) VALUES(@Name, @TelNum)";
                    SqlCommand sqlCommand = new SqlCommand(sql, sqlConnection);
                    SqlParameter sqlParameter = new SqlParameter
                    {
                        ParameterName = "@TelNum",
                        Value = "123 23456789"
                        

                    };//修改電話號碼
                    sqlCommand.Parameters.Add(sqlParameter);
                    sqlParameter = new SqlParameter
                    {
                        ParameterName = "@Name",
                        Value = "Gyro Gearloose"
                    };
                    sqlCommand.Parameters.Add(sqlParameter);
                    sqlCommand.ExecuteNonQuery();

                    //Do I have Gyro telephone number changed?

                    sqlCommand = new SqlCommand("SELECT * FROM Dentist;", sqlConnection);
                    using (SqlDataReader sqlDataReader= sqlCommand.ExecuteReader())
                    {
                        if (sqlDataReader.HasRows)
                        {
                            while (sqlDataReader.Read())
                            {
                                Console.WriteLine(String.Format("{0},{1},{2}",
                                    sqlDataReader[0], sqlDataReader[1], sqlDataReader[2]));

                            }
                        }
                        else
                        {
                            Console.WriteLine("No rows found.");
                        }
                        
                    }
                }
                catch(Exception ex)
                {
                    Console.WriteLine("Whaaaaat!?");
                    Console.WriteLine(ex.Message);
                }
            }
        }
    }
}
