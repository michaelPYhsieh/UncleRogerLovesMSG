echo ""


input=".env"
while IFS= read -r line
do
    export "$line"
done < "$input"



pipenv____________="python3.7 -m pipenv "

pipenv_shell______=$pipenv____________"shell"
pipenvrun_________=$pipenv____________"run "

pipenv_run_manage_=$pipenvrun_________"python $projname/manage.py "
# pipenv_run_manage_=$pipenvrun_________"python manage.py "


pipenv_rm_________=$pipenv____________"--rm" 
pipenv_install____=$pipenv____________"install" 
makemigrations____=$pipenv_run_manage_"makemigrations $appnames" 
migrate___________=$pipenv_run_manage_"migrate" 
runserver_________=$pipenv_run_manage_"runserver"
qcluster__________=$pipenv_run_manage_"qcluster"
create_super_user_="echo \"from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('ub1', '', 'ub1')\" | $pipenv_run_manage_ shell"


echo 0: $pipenv_rm_________
echo 1: $pipenv_install____
echo 2: $makemigrations____ '\n & '$migrate___________
echo ""
echo 3: $runserver_________
echo ""
echo 4: $qcluster__________
echo 5: create_super_user: ub1/ub1
echo ""


if [ $1 != "" ]; then
    for step in `echo "$1" | fold -w1`; do
        case $step in 
            0 ) 
                echo $pipenv_rm_________ | bash -x
                ;;
            1 )
                echo $pipenv_install____ | bash -x
                ;;
            2 )
                echo $makemigrations____ | bash -x
                echo $migrate___________ | bash -x
                ;;
            4 )
                echo $qcluster__________ | bash -x 
                ;;
            3 )
                echo $runserver_________ | bash -x
                ;;
            5 )
                echo $create_super_user_ | bash -x
                ;;
            * )
                echo "       ? \e[30;47mWHAT\e[0m ?"
                
        esac
    done
else
    read -p " which ? " step
    echo ""
    case $step in 
        0 ) 
            echo $pipenv_rm_________ | bash -x
            ;;
        1 )
            echo $pipenv_install____ | bash -x
            ;;
        2 )
            echo $makemigrations____ | bash -x
            echo $migrate___________ | bash -x
            ;;
        4 )
            echo $qcluster__________ | bash -x 
            ;;
        3 )
            echo $runserver_________ | bash -x
            ;;
        5 )
            echo $create_super_user_ | bash -x
            ;;
        * )
            echo "       ? \e[30;47mWHAT\e[0m ?"
    esac
fi
