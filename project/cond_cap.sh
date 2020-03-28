git clone https://github.com/thesunkid19/conditional-transfer-GPT2.git
cd conditional-transfer-GPT2/

# install requirement packages
pip install -r requirements.txt

# copy required files from isilon
cp /vinai/thunm15/thunm15/project/ParlAI/data/pcap_jsons.zip .
cp /vinai/thunm15/thunm15/project/transfer-learning-conv-ai/GPT2Tokenizer.zip .
rsync --info=progress2 -r /vinai/thunm15/thunm15/project/transfer-learning-conv-ai/gpt2-medium.zip .
rsync --info=progress2 -r /vinai/thunm15/thunm15/project/transfer-learning-conv-ai/gpt2.zip .
rsync --info=progress2 -r /vinai/thunm15/per-project/resnext_att.zip .

# unzip and delete zip files
unzip pcap_jsons.zip; rm pcap_jsons.zip
unzip GPT2Tokenizer.zip; rm GPT2Tokenizer.zip
unzip gpt2-medium.zip; rm gpt2-medium.zip
unzip gpt2.zip; rm gpt2.zip
unzip resnext_att.zip; rm resnext_att.zip; 

# coco-evaluation & wandb setups
sudo apt update
sudo apt-get install default-jre
pip install --upgrade cython
pip install git+https://github.com/salaniz/pycocoevalcap
pip install matplotlib
cp -r /vinai/thunm15/thunm15/project/self-critical.pytorch/coco-caption/pycocoevalcap/spice/lib/stanford-corenlp-3.6.0* /home/ubuntu/.local/lib/python3.7/site-packages/pycocoevalcap/spice/lib/
pip install wandb==0.8.30

# modify coco-evaluation & wandb from python packages (can use sed to directly modify)
cp /vinai/thunm15/per-project/modfiles/eval.py /home/ubuntu/.local/lib/python3.7/site-packages/pycocoevalcap/ #d:45 
cp /vinai/thunm15/per-project/modfiles/file_pusher.py /home/ubuntu/.local/lib/python3.7/site-packages/wandb/ #a:78
cp /vinai/thunm15/per-project/modfiles/run_manager.py /home/ubuntu/.local/lib/python3.7/site-packages/wandb/ #d:1438,1439
cp /vinai/thunm15/per-project/modfiles/tokenization_utils.py /home/ubuntu/.local/lib/python3.7/site-packages/pytorch_transformers/ #r:819, a:725

