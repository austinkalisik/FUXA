// Hotfix the known initial-layout race in this reviewed FUXA build.
// Authentication and backend permissions are unchanged.
const fs=require('fs'),path=require('path');
const root=process.argv[2]||'/usr/src/app/FUXA/client/dist';
const indexPath=path.join(root,'index.html');
let html=fs.readFileSync(indexPath,'utf8');
const match=html.match(/src="(main\.[^"?]+\.js)(?:\?[^"<>]*)?"/);
if(!match)throw Error('Cannot locate the main bundle');
const bundle=path.join(root,match[1]);
const original=fs.readFileSync(bundle,'utf8');
const needle='.hmi.layout.loginonstart';
const fixed='.hmi?.layout?.loginonstart';
const count=original.split(needle).length-1;
if(count===1){fs.writeFileSync(bundle+'.tidalwave-new',original.replace(needle,fixed));fs.renameSync(bundle+'.tidalwave-new',bundle);}
else if(count!==0||!original.includes(fixed)){throw Error('Unreviewed startup expression; refusing to modify bundle');}
html=html.replace(match[0],`src="${match[1]}?v=tidalwave-startup-1"`);
fs.writeFileSync(indexPath+'.tidalwave-new',html);fs.renameSync(indexPath+'.tidalwave-new',indexPath);
console.log('Initial-layout guard verified; bundle cache version updated.');
