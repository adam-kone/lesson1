resource "null_resource" "websvrhttpd" {
  depends_on = [oci_core_instance.websvr]
  provisioner "remote-exec" {
    connection {
      type ="ssh"
      user = "opc"
      host = data.oci_core_vnic.vnic.public_ip_address
      private_key = file(var.private_key_path)
      script_path = "/home/opc/myssh.sh"
      agent= false
      timeout = "10m"
    }
    inline= ["echo'== 1."
    ]
  }
}