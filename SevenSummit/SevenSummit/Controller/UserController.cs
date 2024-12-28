using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SevenSummit.Model.Entity;
using SevenSummit.Model.Repository;
using SevenSummit.Model.Context;

namespace SevenSummit.Controller
{
    public class UserController
    {
        // deklarasi objek repository untuk menjalankan operasi CRUD
        private UserRepository _repository;
        
        public int Create(User usr)
        {
            int result = 0;

            // cek npm yang diinputkan tidak boleh kosong 
            if (string.IsNullOrEmpty(usr.Id))
            {
                MessageBox.Show("Id harus diisi !!!", "Peringatan",
                        MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return 0;
            }

            // cek nama yang diinputkan tidak boleh kosong 
            if (string.IsNullOrEmpty(usr.Nama))
            {
                MessageBox.Show("Nama harus diisi !!!", "Peringatan",
                        MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return 0;
            }

            // cek angkatan yang diinputkan tidak boleh kosong 
            if (string.IsNullOrEmpty(usr.Alamat))
            {
                MessageBox.Show("Alamat harus diisi !!!", "Peringatan",
                        MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return 0;
            }

            // membuat objek context menggunakan blok using 
            using (DbContext context = new DbContext())
            {
                // membuat objek class repository 
                _repository = new UserRepository(context);

                // panggil method Create class repository untuk menambahkan data 
                result = _repository.Create(usr);
            }

            if (result > 0)
            {
                MessageBox.Show("Data mahasiswa berhasil disimpan !", "Informasi",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
                MessageBox.Show("Data mahasiswa gagal disimpan !!!", "Peringatan",
                        MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            return result;
        }
    }
}
