using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using SevenSummit.Model.Entity;
using SevenSummit.Model.Context;

namespace SevenSummit.Model.Repository
{
    public class UserRepository
    {
        private MySqlConnection _conn;

        public UserRepository(DbContext context)
        {
            _conn = context.Conn;
        }

        public int Create(User usr)
        {
            int result = 0;
            // deklarasi perintah SQL
            string sql = @"insert into User (id_User, nama_Lengkap, Alamat, Tanggal_Lahir)
                            values (@id_User, @nama_Lengkap, @Alamat, @Tanggal_Lahir)";
            // membuat objek command menggunakan blok using
            using (MySqlCommand cmd = new MySqlCommand(sql, _conn))
            {
                // mendaftarkan parameter dan mengeset nilainya
                cmd.Parameters.AddWithValue("@id_User", usr.Id);
                cmd.Parameters.AddWithValue("@nama_Lengkap", usr.Nama);
                cmd.Parameters.AddWithValue("@Alamat", usr.Alamat);
                cmd.Parameters.AddWithValue("@Tanggal_Lahir", usr.Tanggal_Lahir);
                try
                {
                    // jalankan perintah INSERT dan tampung hasilnya ke dalam variabel result
                result = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print("Create error: {0}", ex.Message);
                }
            }
            return result;
        }
        public int Update(User usr)
        {
            int result = 0;
            // deklarasi perintah SQL
            string sql = @"update User set nama_Lengkap=@Nama, Alamat=@Alamat, Tanggal_Lahir=@Tanggal_Lahir where id_User=@id_User";
            // membuat objek command menggunakan blok using
            using (MySqlCommand cmd = new MySqlCommand(sql, _conn))
            {
                // mendaftarkan parameter dan mengeset nilainya
                cmd.Parameters.AddWithValue("@nama_Lengkap", usr.Nama);
                cmd.Parameters.AddWithValue("@Alamat", usr.Alamat);
                cmd.Parameters.AddWithValue("@Tanggal_Lahir", usr.Tanggal_Lahir);
                cmd.Parameters.AddWithValue("@id_User", usr.Id);
                try
                {
                    // jalankan perintah INSERT dan tampung hasilnya ke dalam variabel result
                    result = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print("Update error: {0}", ex.Message);
                }
            }
            return result;
        }
        public int Delete(User usr)
        {
            int result = 0;
            // deklarasi perintah SQL
            string sql = @"delete User where id_User=@id_User";
            // membuat objek command menggunakan blok using
            using (MySqlCommand cmd = new MySqlCommand(sql, _conn))
            {
                // mendaftarkan parameter dan mengeset nilainya
                cmd.Parameters.AddWithValue("@id_User", usr.Id);
                try
                {
                    // jalankan perintah INSERT dan tampung hasilnya ke dalam variabel result
                    result = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.Print("Delete error: {0}", ex.Message);
                }
            }
            return result;
        }
    }
}
