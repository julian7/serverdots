ldapq () {
    strategy=sub
	authdn=${1%:*}
	pw=${1#*:}
	url=$2
	dn=$3
	shift 3
    if [[ "$1" = "-ls" ]]; then
        if [[ -n "$2" ]]; then
            dn="$2,$dn"
        else
            set -- -ls . .
        fi
        strategy=one
        shift 2
    fi

	ldapsearch -o ldif-wrap=no -x -D "$authdn" -y ~/.pw/"$pw" -H "$url" -s $strategy -b "$dn" -LLL "$@" |
    LANG=C awk '{print | cmd; close(cmd); print ""}' RS= cmd=sort
}

saveldappw () {
    local authdn="$1"
    local pwdir="$HOME/.pw"
    if [[ "$1" == "" ]]; then
        echo "Usage: $0 <username>"
        echo
        echo "This command saves password for a username to be used with ldapq. Usually username is"
        echo "auth DN, but you might want to store it in a different name, for example user is"
        echo "represented under a different names in certain LDAP servers, but passwords are the same."
        exit 1
    fi
    mkdir -p "$pwdir"
    chmod 700 "$pwdir"
    echo -n "$authdn password: "
    read -s pw
    echo
    echo -n ${pw} > "$pwdir/$authdn"
    unset pw
    chmod 600 "$pwdir/$authdn"
    echo "Password set."
}
