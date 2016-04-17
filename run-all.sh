
host=$(hostname)

loginHost="hslogin1"
if [ "$host" != "$loginHost" ]; then
	echo "Script can only execute at the client hslogin1 not cluster nodes"
	exit 1
fi

/home/tpeera4/projects/scripts/crawler-start.sh

ssh hslogin1 '/home/tpeera4/projects/scripts/run-and-cleanup.sh'

/home/tpeera4/projects/scripts/save-analysis-to-db.sh

/home/tpeera4/projects/scripts/check-db-status.sh

/home/tpeera4/projects/scripts/run-pyspark-analysis-script.sh