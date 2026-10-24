# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.16.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.16.1/asc_5.16.1_macOS_arm64'
      sha256 '85a848ef33fe3490adc4f0348af30b7bbf95209a258dac06c735318f62495707'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.16.1/asc_5.16.1_macOS_amd64'
      sha256 '5a978732e0c2f2b673da601568c489dfaa232ae32c93dcfa63b95f0b892a2580'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.16.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.16.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
