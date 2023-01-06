<?php

/**
 * get all profile in file json
 * @return array
 */
function getProfileWeb(): array
{
    if (stripos(PHP_OS, "WIN") === 0) {
        $json = file_get_contents(APPPATH . '\setting\profile_web.json');
    } else {
        $json = file_get_contents(APPPATH . '/setting/profile_web.json');
    }
    return json_decode($json, true);
}


function tanggal_indo($tanggal)
{
    $bulan = array(
        1 =>   'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    );
    $split = explode('-', $tanggal);
    return substr($split[2], 0, 2) . ' ' . $bulan[(int)$split[1]] . ' ' . $split[0];
}
