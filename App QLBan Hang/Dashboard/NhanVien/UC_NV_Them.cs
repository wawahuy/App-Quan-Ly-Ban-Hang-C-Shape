﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;

namespace App_QLBan_Hang.Dashboard.NhanVien
{
    public partial class UC_NV_Them : UserControl
    {
        public UC_NV_Them()
        {
            InitializeComponent();
        }

        private void btn_them_Click(object sender, EventArgs e)
        {
            DTO.DTONhanVien nv = themNhanVien();
            if ( nv != null)
            {
                xoaNoiDungForm();
            }
        }

        private void btn_themvaxem_Click(object sender, EventArgs e)
        {
            DTO.DTONhanVien nv = themNhanVien();
            if (nv != null)
            {
                UCNhanVien ucnv = new UCNhanVien();
                ucnv.xemThongTin(nv);
                FDashboard.openUserControl(ucnv);
            }
        }


        private DTO.DTONhanVien themNhanVien()
        {
            if (!checkTextBox())
            {
                MessageBox.Show("Vui lòng kiểm tra tính hợp lệ của thông tin nhập!");
                return null;
            }

            DTO.DTONhanVien nhanvien = new DTO.DTONhanVien();
            nhanvien.Taikhoan = txb_taikhoan.Text;
            nhanvien.Ten = txb_hoten.Text;
            nhanvien.Giotinh = txb_gioitinh.selectedIndex == 1;
            nhanvien.Diachi = txb_diachi.Text;
            nhanvien.Luong = int.Parse(txb_luong.Text);
            nhanvien.Gianhap = txb_gianhap.Value;
            nhanvien.Chucvu = (new BUS.BUSChucVu()).LayChucVuQuaTen(txb_chucvu.selectedValue);
            nhanvien.Sdt = txb_sdt.Text;
            nhanvien.Matkhau = txb_pass1.Text;
            nhanvien.Cmnd = txb_cmnd.Text;
            nhanvien.Ngaysinh = txb_ngaysinh.Value;

            bool status = (new BUS.BUSNhanVien()).them(nhanvien);

            if (!status)
            {
                MessageBox.Show("Thêm nhân viên thất bại!");
                return null;
            } else
            {
                MessageBox.Show("Thêm nhân viên thành công!");
                return nhanvien;
            }

        }

        private void xoaNoiDungForm()
        {
            txb_cmnd.Text = txb_diachi.Text = txb_hoten.Text = txb_taikhoan.Text = txb_luong.Text = txb_sdt.Text = txb_pass1.Text = txb_pass2.Text = "";
        }

        private void txb_number_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar);
        }

        private void txb_update_OnValueChanged(object sender, EventArgs e)
        {
            checkTextBox();
        }

        private bool checkTextBox()
        {
            bool complete = true;

            //Kiểm tra họ tên
            lb_hoten.Text = "";
            if (txb_hoten.Text == "")
            {
                complete = false;
            }
            else if (!Regex.IsMatch(txb_hoten.Text, @"\s"))
            {
                lb_hoten.Text = "Vui lòng nhập tên đầy đủ!\r\n";
                complete = false;
            }


            //Kiểm tra địa chỉ
            lb_diachi.Text = "";
            if (txb_diachi.Text == "")
            {
                complete = false;
            }
            else if (!Regex.IsMatch(txb_diachi.Text, @",") || txb_diachi.Text.Length <= 10)
            {
                lb_diachi.Text = "Vui lòng nhập địa chỉ đúng!\r\n";
                complete = false;
            }

            
            // Kiểm tra tên tài khoản
            lb_taikhoan.Text = "";
            if (txb_taikhoan.Text == "")
            {
                complete = false;
            }
            else if ((new BUS.BUSNhanVien()).tonTaiTaiKhoan(txb_taikhoan.Text))
            {
                lb_taikhoan.Text = "Tài khoản này đã tồn tại!\r\n";
                complete = false;
            }
            else if (txb_taikhoan.Text.Length < 6)
            {
                lb_taikhoan.Text = "Vui lòng nhập tài khoản >= 6 kí tự!\r\n";
                complete = false;
            }
            else if (!Regex.IsMatch(txb_taikhoan.Text, @"^[a-zA-Z0-9_]+$"))
            {
                lb_taikhoan.Text = "Vui lòng nhập tài khoản không có kí tự đặc biệc!\r\n";
                complete = false;
            }

            lb_gioitinh.Text = "";
            if (txb_gioitinh.selectedIndex == -1)
            {
                lb_gioitinh.Text = "Vui lòng chọn giới tính!\r\n";
                complete = false;
            }

            lb_chucvu.Text = "";
            if (txb_chucvu.selectedIndex == -1)
            {
                lb_chucvu.Text = "Vui lòng chọn chức vụ!\r\n";
                complete = false;
            }

            lb_pass1.Text = "";
            if (txb_pass1.Text == "")
            {
                complete = false;
            }
            else if (txb_pass1.Text.Length < 6)
            {
                lb_pass1.Text = "Vui lòng nhập mật khẩu >= 6 kí tự!\r\n";
                complete = false;
            }

            lb_pass2.Text = "";
            if (txb_pass1.Text != txb_pass2.Text)
            {
                lb_pass2.Text = "Nhập lại mật khẩu không trùng nhau!\r\n";
                complete = false;
            }


            lb_luong.Text = "";
            if (txb_luong.Text == "")
            {
                complete = false;
            }


            lb_sdt.Text = "";
            if (txb_sdt.Text == "")
            {
                complete = false;
            }
            else if (!(txb_sdt.Text.Length >=9 && txb_sdt.Text.Length <= 12))
            {
                lb_sdt.Text = "Vui lòng nhập đúng sđt!\r\n";
                complete = false;
            }

            return complete;
        }

        private void UC_NV_Them_Load(object sender, EventArgs e)
        {
            BUS.BUSChucVu chucvu = new BUS.BUSChucVu();
            List<string> cvs = Shared.SFunction.GetArrByPrototype<DTO.DTOChucVu, string>(chucvu.layHetChucVu(), "Tenchucvu");
            txb_chucvu.Items = cvs.ToArray();
        }

        private void btn_refer_Click(object sender, EventArgs e)
        {
            xoaNoiDungForm();
        }

        private void txb_gioitinh_onItemSelected(object sender, EventArgs e)
        {
            checkTextBox();

        }
    }
}
