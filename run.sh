echo ------------------------------------ >> results.txt;

echo adonis.js test: >> results.txt ;
cd yardstick;
npm install;
npm run serve:dev & sleep 10;
cd ..;
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:3333/ | grep "Requests per second:" >> results.txt ;
pkill -f server.js ;
sleep 5;


echo fastify test: >> results.txt ;
node fastify.js & sleep 5 ;
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f server.js ;
sleep 5;

echo express test:>> results.txt ;
node expressserver.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f expressserver ;
sleep 5 

echo hapi test: >> results.txt ;
node hapiserver.js & sleep 5 ;
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f hapiserver ;
sleep 5 

echo node_rawhttp test: >> results.txt ;
node rawnodeserver.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f rawnodeserver ;
sleep 5 

echo restify test:>> results.txt ;
node restifyserver.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f restifyserver ;
sleep 5 

echo koa2 test: >> results.txt ;
node koa2server.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f koa2server ;
sleep 5 


echo total.js >> results.txt ;
node totalserver/total.js & sleep 5 ; 
ab -k -n 50000 -c 100 -t 20 http://127.0.0.1:8000/ | grep "Requests per second:" >> results.txt ;
pkill -f total ;
sleep 5 ;


