git clone https://github.com/thesunkid19/conditional-transfer-GPT2.git ~/conditional-transfer-GPT2&&
cd ~/conditional-transfer-GPT2/ &&

# copy tensorflow package from isilon instead of downloading it, cuz the Internet is so slowww
# install requirement packages
cp /vinai/thunm15/py-packages/tensorflow_gpu-2.1.0-cp37-cp37m-manylinux2010_x86_64.whl ~/ &&
pip install ~/tensorflow_gpu-2.1.0-cp37-cp37m-manylinux2010_x86_64.whl && # for tensorboardX
pip install ipython && # I love it

pip install -r requirements.txt &&
# copy required files from isilon
cp /vinai/thunm15/thunm15/project/ParlAI/data/pcap_jsons.zip . &&
cp /vinai/thunm15/thunm15/project/transfer-learning-conv-ai/GPT2Tokenizer.zip . &&
rsync --info=progress2 -r /vinai/thunm15/thunm15/project/transfer-learning-conv-ai/distilgpt2.zip . &&
rsync --info=progress2 -r /vinai/thunm15/thunm15/project/transfer-learning-conv-ai/gpt2.zip . &&

# unzip and delete zip files
unzip pcap_jsons.zip && rm pcap_jsons.zip &&
unzip GPT2Tokenizer.zip && rm GPT2Tokenizer.zip &&

# coco-evaluation & wandb setups
sudo apt update &&
sudo apt-get install default-jre &&
pip install --upgrade cython &&
pip install git+https://github.com/salaniz/pycocoevalcap &&
pip install matplotlib &&
git clone https://github.com/ruotianluo/cider.git &&
cp -r /vinai/thunm15/thunm15/project/self-critical.pytorch/coco-caption/pycocoevalcap/spice/lib/stanford-corenlp-3.6.0* /home/ubuntu/.local/lib/python3.7/site-packages/pycocoevalcap/spice/lib/ &&
pip install wandb==0.8.30 &&

# modify coco-evaluation & wandb from python packages (can use sed to directly modify)
cp /vinai/thunm15/per-project/modfiles/eval.py /home/ubuntu/.local/lib/python3.7/site-packages/pycocoevalcap/ && #d:45 
cp /vinai/thunm15/per-project/modfiles/file_pusher.py /home/ubuntu/.local/lib/python3.7/site-packages/wandb/ && #a:78
cp /vinai/thunm15/per-project/modfiles/run_manager.py /home/ubuntu/.local/lib/python3.7/site-packages/wandb/ && #d:1438,1439
cp /vinai/thunm15/per-project/modfiles/tokenization_utils.py /home/ubuntu/.local/lib/python3.7/site-packages/pytorch_transformers/ && #r:819, a:725
cp /vinai/thunm15/per-project/modfiles/ciderD* ~/conditional-transfer-GPT2/cider/pyciderevalcap/ciderD/ && # add:93,05 n para into self.cook_append to control the number of ngram; change:80 'data' folder -> 'pcap_jsons' folder
cp /vinai/thunm15/per-project/modfiles/bleu* ~/conditional-transfer-GPT2/cider/pyciderevalcap/ciderD/ &&
cp /vinai/thunm15/per-project/modfiles/checkpoint.py /home/ubuntu/.local/lib/python3.7/site-packages/ignite/handlers/ # add: 285

