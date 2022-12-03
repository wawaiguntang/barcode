<?php
include_once APPPATH . '/third_party/FPDF/fpdf.php';


class Fpdf_header extends FPDF
{
    // Page header
    public $penjualan;
    public $title = 'FAKTUR PENJUALAN';
    public $isDo = false;
    function Header()
    {

        if ($this->isDo) {
            $this->SetMargins(5, 2, 5);
        } else {
            $this->SetMargins(3, 2, 3);
        }

        $this->SetY(4);
        $width = $this->isDo ? 74 : 74;
        $this->SetFont('Arial', '', 10);
        // $ImagePath = $_SERVER["DOCUMENT_ROOT"] . '/assets/img/logos/logo-1.png';
        // $this->Image($ImagePath, $this->isDo ? 5 : 3.2, 3, -600);
        $this->Image(base_url('assets/img/logos/logo-1.png'), $this->isDo ? 5 : 3.2, 3, -600);

        $this->SetFont('Arial', 'B', 14);
        $this->Cell(0, 4,  $this->title, 0, 0, 'C');
        $this->SetFont('Arial', '', 8);
        $this->Cell(0, 6, date('Y-m-d H:i:s'), 0, 1, 'R');
        $this->SetFont('Arial', '', 11);
        $this->Cell($width, 4);
        $this->Cell(53, 4, 'Tanggal : ' . date("d-m-Y", strtotime($this->penjualan->tgl_transaksi)), 0, 0, 'C');
        $this->Cell(20, 4, 'Pelanggan', 0, 0, 'L');
        $this->Cell(2, 4, ':', 0, 0, 'C');
        $this->Cell(0, 4, $this->penjualan->nmpelanggan, 0, 1, 'L');
        $this->SetFont('Arial', '', 10);
        $this->Cell($width, 10, 'Jl A.Yani No:205 Margorahayu  II', 0, 0, 'L');
        $this->SetFont('Arial', '', 11);
        $this->Cell(53, 4, 'Faktur : ' . $this->penjualan->nofaktur, 0, 0, 'C');
        $this->Cell(20, 4, 'Alamat', 0, 0, 'L');
        $this->Cell(2, 4, ':', 0, 0, 'C');
        $this->MultiCell(0, 4, $this->penjualan->alamat_jalan . ' ' . $this->penjualan->kabupaten . ' ' . $this->penjualan->provinsi, 0, 'L');
        $this->Cell(0, 0, '', 0, 1, 'L');
        $this->SetFont('Arial', '', 10);
        $y = $this->GetY() >=  25 ? -5 : ($this->GetY() <= 18 ? 10 : 2);
        $this->Cell($this->isDo ? 127 : 127, $y, 'Kota Gajah, Lampung Tengah ', 0, 0, 'L');
        $this->SetFont('Arial', '', 11);
        $this->Cell(20, 4, 'Telepon', 0, 0, 'L');
        $this->Cell(2, 4, ':', 0, 0, 'C');
        $this->Cell(0, 4, $this->penjualan->notelp, 0, 1, 'L');
        // $this->Cell(190, 4, 'Email : ' . $this->penjualan->email, 0, 1, 'R');
        if ($y == 2) {
            $this->Ln(1);
        } else {
            $this->Ln(5);
        }
    }
    // Page footer
    function Footer()
    {
        // Position at 1.5 cm from bottom
        $this->SetY(-6);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 1, 'Halaman ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}
