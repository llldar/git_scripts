#!/usr/bin/env zx

let scripts = await globby(`${__dirname}/*.sh`);

for(let script of scripts){
    let content = await fs.readFile(script);
    const newContent = content.toString().replace(/(?<=TARGET_BRANCH=")[^"]+/g, argv['_'][1] ? argv['_'][1] : 'master');
    await fs.writeFile(script, newContent);
}