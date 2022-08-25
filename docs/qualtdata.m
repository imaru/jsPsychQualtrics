[fn, fpath]=uigetfile([userpath '/*.csv']);
opt=detectImportOptions([fpath fn]);
dat=readtable([fpath fn],opt);

nsubs=size(dat,1);
ntrl=0;
for sb=1:nsubs
    ntrl=0;
    tempdat=jsondecode(dat.datajs{sb});
    for dcol=1:length(tempdat)
        if isfield(tempdat{dcol},'task')
            if strcmpi(tempdat{dcol}.task,'response')
                ntrl=ntrl+1;
                datmtx.rt(ntrl,sb)=tempdat{dcol}.rt;
                datmtx.correct(ntrl,sb)=tempdat{dcol}.correct;
            end
        end
    end
end
sum(datmtx.correct)/ntrl*100
sum(datmtx.rt.*datmtx.correct)./sum(datmtx.correct)
