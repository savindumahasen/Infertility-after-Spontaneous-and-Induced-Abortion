import React, { useState } from 'react';
import { Form, Input, Button, Typography, Card, Space } from 'antd';
import './App.css'; // Include custom CSS for better styling

const { Title } = Typography;

function App() {
  const [form] = Form.useForm();
  const [result, setResult] = useState(null);

  const handleFinish = async (values) => {
    const response = await fetch('http://localhost:8000/predict', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(values),
    });
    const data = await response.json();
    setResult(data);
  };

  return (
    <div className="app-container">
      <Card className="prediction-card" title={<Title level={3}>Infertility-after-Spontaneous-and-Induced-Abortion</Title>}>
        <Form form={form} onFinish={handleFinish} layout="vertical" className="custom-form">
          <Form.Item name="age" label="Age" rules={[{ required: true }]}>
            <Input type="number" className="input-field" />
          </Form.Item>
          <Form.Item name="parity" label="Parity" rules={[{ required: true }]}>
            <Input type="number" className="input-field" />
          </Form.Item>
          <Form.Item name="induced" label="Induced" rules={[{ required: true }]}>
            <Input type="number" className="input-field" />
          </Form.Item>
          <Form.Item name="spontaneous" label="Spontaneous" rules={[{ required: true }]}>
            <Input type="number" className="input-field" />
          </Form.Item>
          <Form.Item name="stratum" label="Stratum" rules={[{ required: true }]}>
            <Input className="input-field" />
          </Form.Item>
          <Form.Item name="pooledStratum" label="Pooled Stratum" rules={[{ required: true }]}>
            <Input className="input-field" />
          </Form.Item>
          <Form.Item>
            <Button type="primary" htmlType="submit" className="submit-button" block>
              Submit
            </Button>
          </Form.Item>
        </Form>

        {result && (
          <Space direction="vertical" size="middle" style={{ marginTop: '2rem', width: '100%' }}>
            <Title level={4}>Prediction Result:</Title>
            <Card>
              <pre>{JSON.stringify(result, null, 2)}</pre>
            </Card>
          </Space>
        )}
      </Card>
    </div>
  );
}

export default App;
