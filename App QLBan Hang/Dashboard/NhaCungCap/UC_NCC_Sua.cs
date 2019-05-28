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

namespace App_QLBan_Hang.Dashboard.NhaCungCap
{
    public partial class UC_NCC_Sua : UserControl
    {
        DTO.DTONhaCungCap nhacungcap;


        public UC_NCC_Sua()
        {
            InitializeComponent();
        }


        public UC_NCC_Sua(DTO.DTONhaCungCap kh)
        {
            InitializeComponent();
            nhacungcap = kh;

            txb_hoten.Text = kh.Ten;
            txb_diachi.Text = kh.Diachi;
            txb_sdt.Text = kh.Sdt;
        }


        private void btn_sua_Click(object sender, EventArgs e)
        {
            DTO.DTONhaCungCap ncc = suaNhanVien();
            if ( ncc != null)
            {
            }
        }

        private void btn_suavaxem_Click(object sender, EventArgs e)
        {
            DTO.DTONhaCungCap kh = suaNhanVien();
            if (kh != null)
            {
                UCNhaCungCap ucncc = new UCNhaCungCap();
                ucncc.xemThongTin(kh);
                FDashboard.openUserControl(ucncc);
            }
        }


        private DTO.DTONhaCungCap suaNhanVien()
        {
            if (!checkTextBox())
            {
                MessageBox.Show("Vui lòng kiểm tra tính hợp lệ của thông tin nhập!");
                return null;
            }

            DTO.DTONhaCungCap ncc = nhacungcap;
            ncc.Ten = txb_hoten.Text;
            ncc.Diachi = txb_diachi.Text;
            ncc.Sdt = txb_sdt.Text;

            bool status = (new BUS.BUSNhaCungCap()).sua(ncc);

            if (!status)
            {
                MessageBox.Show("Sửa NCC thất bại!");
                return null;
            } else
            {
                MessageBox.Show("Sửa NCC thành công!");
                return ncc;
            }

        }

        private void xoaNoiDungForm()
        {
            txb_diachi.Text = txb_hoten.Text =  txb_sdt.Text =   "";
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


            //kiểm tra tài khoản
            lb_hoten.Text = "";
            if (txb_hoten.Text == "")
            {
                complete = false;
            }
            else if(new BUS.BUSNhaCungCap().tonTaiTen(txb_hoten.Text) && txb_hoten.Text != nhacungcap.Ten)
            {
                lb_hoten.Text = "Tên nhà cung cấp này đã tồn tại!";
                complete = false;
            }


            return complete;
        }

        private void UC_NV_Them_Load(object sender, EventArgs e)
        {
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
