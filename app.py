 command="cd /root/test/ && bash parser-script.sh dataimporttest1 CERULIUM_STAGE-PRES STATEMENT_CALC_FINAL_0 xyz.dat logfile '1999-01-01 00:00:10' '2000-01-01 00:00:02' >/root/test/parser-script-exec.log 2>&1"
 stdin, stdout, stderr = client.exec_command(command)
