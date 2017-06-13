FROM ubuntu:16.04

COPY first_time_setup.sh .

CMD ["./first_time_setup.sh"]
